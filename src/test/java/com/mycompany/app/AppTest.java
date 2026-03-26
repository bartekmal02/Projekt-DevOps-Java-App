package com.mycompany.app;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.web.client.TestRestTemplate;
import static org.junit.jupiter.api.Assertions.assertTrue;

/**
 * Testy dla aplikacji Spring Boot.
 */
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class AppTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void contextLoads() {
        // Sprawdza, czy kontekst Springa w ogóle się podnosi
    }

    @Test
    public void testHelloEndpoint() {
        // Sprawdza, czy wejście na stronę główną zwraca "Hello World"
        String body = this.restTemplate.getForObject("/", String.class);
        assertTrue(body.contains("Hello World"));
    }
}