from selenium.webdriver.chrome.options import Options

def get_chrome_options(headless=False):
    """Create Chrome options for Robot Framework SeleniumLibrary"""
    options = Options()
    
    # Essential options for CI/CD environment
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-gpu')
    options.add_argument('--no-first-run')
    options.add_argument('--no-default-browser-check')
    options.add_argument('--disable-extensions')
    
    if headless:
        options.add_argument('--headless=new')
    
    return options
