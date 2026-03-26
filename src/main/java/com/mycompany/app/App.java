package com.mycompany.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Spring Boot Web Server - Teraz to będzie działać na AWS!
 */
@SpringBootApplication
@RestController
public class App {

    public static void main(String[] args) {
        // Ta linia sprawia, że aplikacja startuje jako serwer i NIE wyłącza się sama
        SpringApplication.run(App.class, args);
    }

    // To, co wpiszesz tutaj, zobaczysz w przeglądarce pod adresem IP:8080
    @GetMapping("/")
    public String sayHello() {
        return "<h1>Hello World! Serwer na AWS działa poprawnie! 🚀</h1>";
    }

    // Punkt dla Prometheusa, żeby wiedział, że aplikacja żyje
    @GetMapping("/health")
    public String health() {
        return "UP";
    }
}
