using UnityEngine;
using System.Collections.Generic;

[System.Serializable]
public class Message
{
    public string auteur;
    public string texte;
}

[System.Serializable]
public class MessageList
{
    public Message[] messages;
}

/// <summary>
/// Parse le fichier JSON des messages et les rend disponibles
/// </summary>
public class MessageParser : MonoBehaviour
{
    public static MessageParser Instance { get; private set; }

    [SerializeField] private TextAsset messagesJsonFile;
    private MessageList messageList;

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    private void Start()
    {
        LoadMessages();
    }

    private void LoadMessages()
    {
        if (messagesJsonFile == null)
        {
            Debug.LogError("[MessageParser] Messages JSON not found!");
            return;
        }

        messageList = JsonUtility.FromJson<MessageList>(messagesJsonFile.text);
        Debug.Log($"[MessageParser] Loaded {messageList.messages.Length} messages");
    }

    public Message[] GetAllMessages()
    {
        if (messageList != null)
        {
            return messageList.messages;
        }
        return new Message[0];
    }

    public void DisplayMessagesOnWall()
    {
        if (messageList == null) return;

        Debug.Log("[MessageParser] Displaying messages on wall:");
        foreach (var msg in messageList.messages)
        {
            Debug.Log($"  [{msg.auteur}] {msg.texte}");
        }
    }

    public string GetFormattedMessages()
    {
        if (messageList == null) return "";

        string formatted = "";
        foreach (var msg in messageList.messages)
        {
            formatted += $"[{msg.auteur}]\n{msg.texte}\n\n";
        }
        return formatted;
    }
}
