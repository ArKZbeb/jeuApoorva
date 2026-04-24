using UnityEngine;
using TMPro;
using System.Collections;

/// <summary>
/// Gère tous les éléments UI: popups, notifications, feedback
/// </summary>
public class UIManager : MonoBehaviour
{
    public static UIManager Instance { get; private set; }

    [SerializeField] private Canvas mainCanvas;
    [SerializeField] private TextMeshProUGUI notificationText;
    [SerializeField] private TextMeshProUGUI feedbackText;
    [SerializeField] private TextMeshProUGUI enigmaQuestionText;
    [SerializeField] private TextMeshProUGUI enigmaAnswerInputText;
    [SerializeField] private GameObject enigmaPanel;
    [SerializeField] private GameObject feedbackPanel;
    [SerializeField] private float feedbackDuration = 3f;

    private Enigma currentEnigma;

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
        if (notificationText == null)
        {
            Debug.LogWarning("[UIManager] Notification text not assigned");
        }
        HideAllPanels();
    }

    public void ShowNotification(string message)
    {
        if (notificationText != null)
        {
            notificationText.text = message;
            notificationText.gameObject.SetActive(true);
            StartCoroutine(HideNotificationAfterTime(2f));
        }
    }

    public void ShowEnigmaPrompt(Enigma enigma)
    {
        currentEnigma = enigma;
        if (enigmaPanel != null && enigmaQuestionText != null)
        {
            enigmaQuestionText.text = enigma.question;
            enigmaPanel.SetActive(true);
        }
    }

    public void SubmitEnigmaAnswer()
    {
        if (currentEnigma == null) return;

        string answer = "";
        if (enigmaAnswerInputText != null)
        {
            answer = enigmaAnswerInputText.text;
        }

        GameManager.Instance.SubmitEnigmaAnswer(currentEnigma.id, answer);
        HideEnigmaPanel();
    }

    public void ClickEnigmaAnswer(int enigmaId)
    {
        GameManager.Instance.ClickEnigmaAnswer(enigmaId);
        HideEnigmaPanel();
    }

    public void ShowFeedback(string message, bool isCorrect)
    {
        if (feedbackText != null && feedbackPanel != null)
        {
            feedbackText.text = message;
            feedbackText.color = isCorrect ? Color.green : Color.red;
            feedbackPanel.SetActive(true);
            StartCoroutine(HideFeedbackAfterTime(feedbackDuration));
        }
    }

    private IEnumerator HideNotificationAfterTime(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (notificationText != null)
        {
            notificationText.gameObject.SetActive(false);
        }
    }

    private IEnumerator HideFeedbackAfterTime(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (feedbackPanel != null)
        {
            feedbackPanel.SetActive(false);
        }
    }

    public void HideEnigmaPanel()
    {
        if (enigmaPanel != null)
        {
            enigmaPanel.SetActive(false);
            if (enigmaAnswerInputText != null)
            {
                enigmaAnswerInputText.text = "";
            }
        }
    }

    private void HideAllPanels()
    {
        if (enigmaPanel != null) enigmaPanel.SetActive(false);
        if (feedbackPanel != null) feedbackPanel.SetActive(false);
        if (notificationText != null) notificationText.gameObject.SetActive(false);
    }
}
