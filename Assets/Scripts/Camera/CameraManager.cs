using UnityEngine;

/// <summary>
/// Gère le split-screen 2x2 pour 4 joueurs
/// Chaque caméra affiche un quart de l'écran
/// Layout:
/// +-------+-------+
/// | P1(0) | P2(1) |
/// +-------+-------+
/// | P3(2) | P4(3) |
/// +-------+-------+
/// </summary>
public class CameraManager : MonoBehaviour
{
    public static CameraManager Instance { get; private set; }

    [SerializeField] private PlayerController[] playerControllers = new PlayerController[4];
    private Camera[] playerCameras = new Camera[4];

    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }
        Instance = this;
    }

    private void Start()
    {
        SetupSplitScreen();
    }

    public void RegisterPlayer(PlayerController playerController, int playerIndex)
    {
        if (playerIndex >= 0 && playerIndex < 4)
        {
            playerControllers[playerIndex] = playerController;
            playerCameras[playerIndex] = playerController.GetCamera();
            Debug.Log($"[CameraManager] Player {playerIndex} registered");
        }
    }

    private void SetupSplitScreen()
    {
        for (int i = 0; i < 4; i++)
        {
            if (playerCameras[i] != null)
            {
                Rect viewport = GetViewportForPlayer(i);
                playerCameras[i].rect = viewport;
                Debug.Log($"[CameraManager] Camera {i} set to viewport: {viewport}");
            }
        }
    }

    private Rect GetViewportForPlayer(int playerIndex)
    {
        // 2x2 split screen
        // 0 = top-left,    1 = top-right
        // 2 = bottom-left, 3 = bottom-right
        
        switch (playerIndex)
        {
            case 0: return new Rect(0f, 0.5f, 0.5f, 0.5f);   // Top-left
            case 1: return new Rect(0.5f, 0.5f, 0.5f, 0.5f); // Top-right
            case 2: return new Rect(0f, 0f, 0.5f, 0.5f);     // Bottom-left
            case 3: return new Rect(0.5f, 0f, 0.5f, 0.5f);   // Bottom-right
            default: return new Rect(0, 0, 1, 1);
        }
    }
}
