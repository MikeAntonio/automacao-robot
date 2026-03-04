from selenium.webdriver.chrome.options import Options

def get_chrome_options(headless=False):
    """Create Chrome options for Robot Framework SeleniumLibrary"""
    options = Options()
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--disable-blink-features=AutomationControlled')
    
    if headless:
        options.add_argument('--headless=new')
    
    return options
