package com.vts.customerrelationshipmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    private final DataSource securityDataSource;

    public SecurityConfig(DataSource securityDataSource) {
        this.securityDataSource = securityDataSource;
    }

    @Bean
    public UserDetailsManager userDetailsManager() {

        JdbcUserDetailsManager jdbcUserDetailsManager = new JdbcUserDetailsManager();

        jdbcUserDetailsManager.setDataSource(securityDataSource);

        return jdbcUserDetailsManager;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(configurer -> configurer
                        .antMatchers("/customer/showForm*").hasRole("ADMIN")
                        .antMatchers("/customer/save*").hasRole("ADMIN")
                        .antMatchers("/customer/delete*").hasRole("ADMIN")
                        .antMatchers("/resources/**").permitAll()
                        .anyRequest().authenticated())

                .formLogin()
                .loginPage("/loginPage")
                .loginProcessingUrl("/authenticateTheUser")
                .permitAll()
                .and()

                .logout(LogoutConfigurer::permitAll)
                .exceptionHandling().accessDeniedPage("/access-denied");

        return http.build();
    }
}
