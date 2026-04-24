using UnityEngine;

/// <summary>
/// Objet interactif dans le monde (drapeaux, micro, photos, etc.)
/// </summary>
public class InteractableObject : MonoBehaviour, IInteractable
{
    [SerializeField] private string objectId;
    [SerializeField] private string interactionText = "Interact";
    [SerializeField] private bool isEnigmaObject = false;
    [SerializeField] private int enigmaId = -1;

    private void Start()
    {
        // Ajouter un trigger collider si absent
        Collider col = GetComponent<Collider>();
        if (col != null && !col.isTrigger)
        {
            col.isTrigger = true;
        }
    }

    public void Interact(int playerIndex)
    {
        Debug.Log($"[InteractableObject] {objectId} interacted by player {playerIndex}");
        
        if (isEnigmaObject)
        {
            // Notifier GameManager pour traiter l'énigme
            GameManager.Instance.OnEnigmaObjectInteracted(enigmaId, objectId);
        }
        else
        {
            // Afficher du texte ou déclencher une action simple
            UIManager.Instance.ShowNotification(interactionText);
        }
    }

    public string GetObjectId()
    {
        return objectId;
    }

    public int GetEnigmaId()
    {
        return enigmaId;
    }
}
