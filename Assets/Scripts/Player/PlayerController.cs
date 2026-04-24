using UnityEngine;

/// <summary>
/// Contrôle le mouvement et la caméra d'un joueur FPS
/// Un script par joueur, commandé par InputManager
/// </summary>
public class PlayerController : MonoBehaviour
{
    [Header("Mouvement")]
    [SerializeField] private float moveSpeed = 5f;
    [SerializeField] private float sprintSpeed = 8f;
    [SerializeField] private float groundDrag = 5f;
    
    [Header("Caméra")]
    [SerializeField] private Camera playerCamera;
    [SerializeField] private float mouseSensitivity = 2f;
    [SerializeField] private float maxLookAngle = 90f;

    [Header("Physique")]
    [SerializeField] private Rigidbody rb;
    [SerializeField] private float playerHeight = 2f;
    [SerializeField] private LayerMask groundLayer;

    private int playerIndex;
    private InputManager.PlayerInput playerInput;
    private float xRotation = 0f;
    private bool isGrounded;
    private Vector3 moveDirection;
    private float currentSpeed;

    private void Start()
    {
        // À assigner par le GameManager lors du spawn
        rb = GetComponent<Rigidbody>();
        if (playerCamera == null)
        {
            playerCamera = GetComponentInChildren<Camera>();
        }
    }

    public void Initialize(int index)
    {
        playerIndex = index;
        Debug.Log($"[PlayerController] Player {playerIndex} initialized");
    }

    private void Update()
    {
        if (InputManager.Instance == null || !InputManager.Instance.IsPlayerConnected(playerIndex))
            return;

        playerInput = InputManager.Instance.GetPlayerInput(playerIndex);
        if (playerInput == null) return;

        HandleMovement();
        HandleLook();
    }

    private void HandleMovement()
    {
        // Check groundedness
        isGrounded = Physics.Raycast(transform.position, Vector3.down, playerHeight * 0.5f + 0.2f, groundLayer);

        // Déterminer la vitesse actuelle
        currentSpeed = moveSpeed;

        // Direction basée sur l'input du joystick gauche
        Vector3 inputDirection = new Vector3(playerInput.movementInput.x, 0, playerInput.movementInput.y);
        inputDirection = transform.TransformDirection(inputDirection);

        moveDirection = inputDirection.normalized * currentSpeed;

        // Appliquer la gravité
        if (isGrounded)
        {
            rb.drag = groundDrag;
            rb.velocity = new Vector3(moveDirection.x, rb.velocity.y, moveDirection.z);
        }
        else
        {
            rb.drag = 0;
            rb.velocity += Physics.gravity * Time.deltaTime;
        }

        // Speed control - limiter la velocity
        Vector3 flatVel = new Vector3(rb.velocity.x, 0f, rb.velocity.z);
        if (flatVel.magnitude > currentSpeed)
        {
            Vector3 limitedVel = flatVel.normalized * currentSpeed;
            rb.velocity = new Vector3(limitedVel.x, rb.velocity.y, limitedVel.z);
        }
    }

    private void HandleLook()
    {
        // Joystick droit pour regarder
        float lookX = playerInput.lookInput.x * mouseSensitivity;
        float lookY = playerInput.lookInput.y * mouseSensitivity;

        // Rotation horizontale (autour de Y)
        transform.Rotate(Vector3.up * lookX);

        // Rotation verticale (autour de X) - limiter
        xRotation -= lookY;
        xRotation = Mathf.Clamp(xRotation, -maxLookAngle, maxLookAngle);

        playerCamera.transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
    }

    public int GetPlayerIndex()
    {
        return playerIndex;
    }

    public Camera GetCamera()
    {
        return playerCamera;
    }
}
