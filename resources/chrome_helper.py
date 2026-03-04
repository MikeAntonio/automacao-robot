from selenium.webdriver.chrome.options import Options

def get_chrome_options(headless=False):
    """Create Chrome options for Robot Framework SeleniumLibrary"""
    options = Options()
    
    # Basic stability options for headless mode
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-gpu')
    options.add_argument('--disable-blink-features=AutomationControlled')
    options.add_argument('--disable-web-resources')
    options.add_argument('--disable-component-update')
    
    # Network and security options
    options.add_argument('--start-maximized')
    options.add_argument('--no-first-run')
    options.add_argument('--no-default-browser-check')
    
    if headless:
        options.add_argument('--headless=new')
    
    return options
