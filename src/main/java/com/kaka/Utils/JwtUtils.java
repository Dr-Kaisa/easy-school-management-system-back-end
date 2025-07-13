package com.kaka.Utils;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import java.util.Date;
import java.util.Map;

@Component
public class JwtUtils {
    //先注入到临时变量
    @Value("${jwt.key}")
    private String configKey;

    @Value("${jwt.expire}")
    private Long configExpire;

    private static String signKey;
    private static Long expire;
    //再赋值到静态变量中
    @PostConstruct
    public void init() {
        JwtUtils.signKey = this.configKey;
        JwtUtils.expire = this.configExpire;
    }

    /**
     * 生成JWT令牌
     */
    public static String generateJwt(Map<String,Object> claims){
        return Jwts.builder()
                .addClaims(claims)
                .signWith(SignatureAlgorithm.HS256, signKey)
                .setExpiration(new Date(System.currentTimeMillis() + expire))
                .compact();
    }

    /**
     * 解析JWT令牌
     */
    public static Claims parseJWT(String jwt){
        return Jwts.parser()
                .setSigningKey(signKey)
                .parseClaimsJws(jwt)
                .getBody();
    }
}
