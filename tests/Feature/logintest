<?php

use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\WebDriverBy;
use Facebook\WebDriver\WebDriverExpectedCondition;
use PHPUnit\Framework\TestCase;

class LoginTest extends TestCase
{
    protected $driver;

    public function setUp(): void
    {
        parent::setUp();

        $this->driver = RemoteWebDriver::create(
            'http://localhost:4444/wd/hub', // Selenium WebDriver server URL
            \Facebook\WebDriver\Remote\DesiredCapabilities::chrome()
        );
    }

    public function tearDown(): void
    {
        parent::tearDown();

        if ($this->driver instanceof RemoteWebDriver) {
            $this->driver->quit();
        }
    }

    public function testLogin()
    {
        $this->driver->get('http://your-laravel-app-url/login'); // Replace with your actual Laravel login page URL

        $this->driver->findElement(WebDriverBy::id('email'))->sendKeys('your-email@example.com');
        $this->driver->findElement(WebDriverBy::id('password'))->sendKeys('your-password');
        $this->driver->findElement(WebDriverBy::cssSelector('button[type=submit]'))->click();

        // Wait until dashboard page loads
        $this->driver->wait()->until(
            WebDriverExpectedCondition::urlContains('/dashboard')
        );

        // Assert that we are on the dashboard page
        $this->assertStringContainsString('/dashboard', $this->driver->getCurrentURL());
    }
}
