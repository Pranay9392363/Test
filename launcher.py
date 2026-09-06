import os
import sys
import threading
import time
import webbrowser

from streamlit.web import cli as stcli


def open_browser():
    time.sleep(2)
    webbrowser.open("http://localhost:8501")


if __name__ == "__main__":

    # Location of bundled app.py
    if getattr(sys, "frozen", False):
        app_path = os.path.join(sys._MEIPASS, "app.py")
    else:
        app_path = os.path.join(os.path.dirname(__file__), "app.py")

    sys.argv = [
        "streamlit",
        "run",
        app_path,
        "--server.headless=true",
        "--server.port=8501",
        "--browser.serverAddress=localhost",
        "--server.fileWatcherType=none",
    ]

    threading.Thread(target=open_browser, daemon=True).start()

    sys.exit(stcli.main())
