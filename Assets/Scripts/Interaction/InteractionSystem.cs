using UnityEngine;

/// <summary>
/// Gère les interactions avec les objets (raycast + clic)
/// Chaque joueur peut interagir avec des objets interactifs
/// </summary>
public class InteractionSystem : MonoBehaviour
{
    [SerializeField] private float interactionRange = 5f;
    [SerializeField] private LayerMask interactableLayer;

    private PlayerController playerController;
    private Camera playerCamera;
    private InputManager.PlayerInput playerInput;

    private void Start()
    {
        playerController = GetComponent<PlayerController>();
        playerCamera = playerController.GetCamera();
    }

    private void Update()
    {
        if (InputManager.Instance == null)
            return;

        int playerIndex = playerController.GetPlayerIndex();
        playerInput = InputManager.Instance.GetPlayerInput(playerIndex);

        if (playerInput != null && playerInput.interactPressed)
        {
            HandleInteraction();
        }
    }

    private void HandleInteraction()
    {
        Ray ray = new Ray(playerCamera.transform.position, playerCamera.transform.forward);
        RaycastHit hit;

        if (Physics.Raycast(ray, out hit, interactionRange, interactableLayer))
        {
            IInteractable interactable = hit.collider.GetComponent<IInteractable>();
            
            if (interactable != null)
            {
                interactable.Interact(playerController.GetPlayerIndex());
                Debug.Log($"[InteractionSystem] Player {playerController.GetPlayerIndex()} interacted with {hit.collider.gameObject.name}");
            }
        }
    }

    private void OnDrawGizmosSelected()
    {
        if (playerCamera != null)
        {
            Gizmos.color = Color.green;
            Gizmos.DrawRay(playerCamera.transform.position, playerCamera.transform.forward * interactionRange);
        }
    }
}

/// <summary>
/// Interface pour les objets interactifs
/// </summary>
public interface IInteractable
{
    void Interact(int playerIndex);
}
