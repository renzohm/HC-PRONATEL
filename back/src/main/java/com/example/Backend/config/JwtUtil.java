package com.example.Backend.config;

import com.example.Backend.model.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Component
public class JwtUtil {
    private SecretKey secretKey = Keys.secretKeyFor(SignatureAlgorithm.HS256); // Genera una clave secreta segura

    public String generateToken(User user) {
        Map<String, Object> claims = new HashMap<>();
        claims.put("email", user.getEmail());
        claims.put("id",String.valueOf(user.getId()));


        return Jwts.builder()
                .setClaims(claims) // Asigna todas las reclamaciones de una vez
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 10)) // Token válido por 10 horas
                .signWith(secretKey)
                .compact();
    }
    /*
    public String generateToken(String email,String password,String names,Boolean admin) {
        return Jwts.builder()
                .setSubject(email)
                //.claim("password", password)
                .claim("names", names)
                //.claim("admin", admin.toString())  // Convertir Boolean a String
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 10)) // token válido por 10 horas
                .signWith(secretKey)
                .compact();
    }*/

    public Claims extractClaims(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token)
                .getBody();
    }

    public String extractEmail(String token) {
        return extractClaims(token).getSubject();
    }

    public Boolean isTokenExpired(String token) {
        return extractClaims(token).getExpiration().before(new Date());
    }

    public Boolean extractAdmin(String token) {
        Claims claims = Jwts.parser()
                .setSigningKey(secretKey)
                .build()
                .parseClaimsJws(token)
                .getBody();
        return Boolean.parseBoolean(claims.get("admin").toString());
    }
    public Map<String, Object> decodeToken(String token) {
        Claims claims = extractClaims(token);
        Map<String, Object> data = new HashMap<>();
        data.put("email", claims.get("email", String.class));
        data.put("id", claims.get("id", String.class));

        return data;
    }
    /*
    public String decodeToken(String token) {
        Claims claims = extractClaims(token);
        // Suponiendo que estás guardando una reclamación llamada 'data'
        return claims.get("data", String.class);
    }*/
}
