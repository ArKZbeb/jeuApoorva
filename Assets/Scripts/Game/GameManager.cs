using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

[System.Serializable]
public class Enigma
{
    public int id;
    public string question;
    public string reponse;
    public string indice;
    public string type;
    public string feedback;
}

[System.Serializable]
public class EnigmaList
{
    public Enigma[] enigmes;
}

/// <summary>
/// Gère la progression du jeu, les énigmes et la narration
/// </summary>
public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    [SerializeField] private TextAsset enigmesJsonFile;
    [SerializeField] private int maxPlayers = 4;

    private EnigmaList enigmaList;
    private Dictionary<int, bool> solvedEnigmas = new Dictionary<int, bool>();
    private int currentScene = 0;
    private int totalEnigmas = 0;

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
        LoadEnigmas();
        InitializeScene();
    }

    private void LoadEnigmas()
    {
        if (enigmesJsonFile == null)
        {
            Debug.LogError("[GameManager] Enigmes JSON not found!");
            return;
        }

        enigmaList = JsonUtility.FromJson<EnigmaList>(enigmesJsonFile.text);
        totalEnigmas = enigmaList.enigmes.Length;

        // Initialiser toutes les énigmes comme non-résolues
        for (int i = 0; i < totalEnigmas; i++)
        {
            solvedEnigmas[enigmaList.enigmes[i].id] = false;
        }

        Debug.Log($"[GameManager] Loaded {totalEnigmas} enigmas");
    }

    private void InitializeScene()
    {
        currentScene = SceneManager.GetActiveScene().buildIndex;
        Debug.Log($"[GameManager] Scene {currentScene} initialized");
    }

    public void OnEnigmaObjectInteracted(int enigmaId, string objectId)
    {
        if (enigmaId < 0) return;

        // Chercher l'énigme
        Enigma enigma = null;
        foreach (var e in enigmaList.enigmes)
        {
            if (e.id == enigmaId)
            {
                enigma = e;
                break;
            }
        }

        if (enigma != null)
        {
            Debug.Log($"[GameManager] Enigma {enigmaId} interacted: {enigma.question}");
            UIManager.Instance.ShowEnigmaPrompt(enigma);
        }
    }

    public void SubmitEnigmaAnswer(int enigmaId, string answer)
    {
        Enigma enigma = null;
        foreach (var e in enigmaList.enigmes)
        {
            if (e.id == enigmaId)
            {
                enigma = e;
                break;
            }
        }

        if (enigma == null) return;

        bool isCorrect = answer.ToLower().Replace(" ", "").Equals(enigma.reponse.ToLower().Replace(" ", ""));

        if (isCorrect)
        {
            solvedEnigmas[enigmaId] = true;
            UIManager.Instance.ShowFeedback(enigma.feedback, true);
            CheckAllEnigmasSolved();
            Debug.Log($"[GameManager] Enigma {enigmaId} solved!");
        }
        else
        {
            UIManager.Instance.ShowFeedback($"Incorrect! Indice: {enigma.indice}", false);
            Debug.Log($"[GameManager] Enigma {enigmaId} wrong answer");
        }
    }

    public void ClickEnigmaAnswer(int enigmaId)
    {
        solvedEnigmas[enigmaId] = true;
        Enigma enigma = null;
        foreach (var e in enigmaList.enigmes)
        {
            if (e.id == enigmaId)
            {
                enigma = e;
                break;
            }
        }

        if (enigma != null)
        {
            UIManager.Instance.ShowFeedback(enigma.feedback, true);
        }
        
        CheckAllEnigmasSolved();
        Debug.Log($"[GameManager] Enigma {enigmaId} clicked/solved!");
    }

    private void CheckAllEnigmasSolved()
    {
        foreach (var solved in solvedEnigmas.Values)
        {
            if (!solved) return;
        }
        
        Debug.Log("[GameManager] All enigmas solved!");
        UIManager.Instance.ShowNotification("Toutes les énigmes résolues! Progression...");
        // Ici on pourrait changer de scène
    }

    public bool IsEnigmaSolved(int enigmaId)
    {
        return solvedEnigmas.ContainsKey(enigmaId) && solvedEnigmas[enigmaId];
    }

    public int GetSolvedEnigmaCount()
    {
        int count = 0;
        foreach (var solved in solvedEnigmas.Values)
        {
            if (solved) count++;
        }
        return count;
    }

    public void LoadScene(string sceneName)
    {
        SceneManager.LoadScene(sceneName);
    }
}
