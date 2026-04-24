using UnityEngine;
using UnityEngine.InputSystem;

/// <summary>
/// Gère l'entrée de 4 manettes locales (Xbox/PS4) cross-plateforme
/// Compatible Windows et Mac
/// </summary>
public class InputManager : MonoBehaviour
{
    [System.Serializable]
    public class PlayerInput
    {
        public int playerIndex;
        public Vector2 movementInput;
        public Vector2 lookInput;
        public bool interactPressed;
        public Gamepad gamepad;
    }

    public static InputManager Instance { get; private set; }
    
    [SerializeField] private int maxPlayers = 4;
    private PlayerInput[] playerInputs;
    private int activePlayerCount = 0;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
        InitializeControllers();
    }

    private void InitializeControllers()
    {
        playerInputs = new PlayerInput[maxPlayers];
        
        for (int i = 0; i < maxPlayers; i++)
        {
            playerInputs[i] = new PlayerInput { playerIndex = i };
        }

        Debug.Log($"[InputManager] Initialized for {maxPlayers} players");
        InputSystem.onDeviceChange += OnDeviceChanged;
    }

    private void OnDeviceChanged(InputDevice device, InputDeviceChange change)
    {
        if (device is Gamepad gamepad)
        {
            if (change == InputDeviceChange.Added)
            {
                Debug.Log($"[InputManager] Manette détectée: {gamepad.name}");
            }
            else if (change == InputDeviceChange.Removed)
            {
                Debug.Log($"[InputManager] Manette déconnectée: {gamepad.name}");
            }
        }
    }

    private void Update()
    {
        UpdateGamepadInputs();
    }

    private void UpdateGamepadInputs()
    {
        var gamepads = Gamepad.all;
        activePlayerCount = Mathf.Min(gamepads.Count, maxPlayers);

        for (int i = 0; i < activePlayerCount; i++)
        {
            var gamepad = gamepads[i];
            playerInputs[i].gamepad = gamepad;

            // Movement (joystick gauche)
            playerInputs[i].movementInput = gamepad.leftStick.ReadValue();

            // Look (joystick droit)
            playerInputs[i].lookInput = gamepad.rightStick.ReadValue();

            // Interact (bouton X / Carré)
            playerInputs[i].interactPressed = gamepad.xButton.wasPressedThisFrame || gamepad.squareButton.wasPressedThisFrame;
        }
    }

    public PlayerInput GetPlayerInput(int playerIndex)
    {
        if (playerIndex >= 0 && playerIndex < playerInputs.Length)
        {
            return playerInputs[playerIndex];
        }
        return null;
    }

    public int GetActivePlayerCount()
    {
        return activePlayerCount;
    }

    public bool IsPlayerConnected(int playerIndex)
    {
        if (playerIndex >= 0 && playerIndex < activePlayerCount)
        {
            return playerInputs[playerIndex].gamepad != null;
        }
        return false;
    }

    private void OnDestroy()
    {
        InputSystem.onDeviceChange -= OnDeviceChanged;
    }
}
