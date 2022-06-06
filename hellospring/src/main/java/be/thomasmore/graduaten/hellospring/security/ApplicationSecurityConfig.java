package be.thomasmore.graduaten.hellospring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;

@Configuration
@EnableWebSecurity
public class ApplicationSecurityConfig extends WebSecurityConfigurerAdapter {

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public ApplicationSecurityConfig(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    @Bean
    protected UserDetailsService userDetailsService() {
        UserDetails adminUser = User.builder()
                .username("admin")
                .password(passwordEncoder.encode("fmTQakeoy1enHxIs"))
                .roles("ADMIN")
                .build();
        return new InMemoryUserDetailsManager(adminUser);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http

                .authorizeRequests()
                .antMatchers("/","index","/Client/*","/css/*", "/js/*", "../partials/*","/images/*","/h2/**").permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .formLogin(form -> form
                        .loginPage("/Login")
                        .permitAll()
                        .successForwardUrl("/Admin/Dashboard")
                );
                http.csrf().ignoringAntMatchers("/h2/**");
                http.headers().frameOptions().sameOrigin();
    }
}