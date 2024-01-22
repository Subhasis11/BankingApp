package com.bank.BankingApp.Controller;

import com.bank.BankingApp.Repository.AccountRepository;
import jakarta.transaction.Transactional;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.bank.BankingApp.Repository.UserRepository;
import com.bank.BankingApp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;


@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private AccountRepository accountRepository;
    @GetMapping("/login1")
    public String showLogInForm(@ModelAttribute("user") User user,Model model) {

        return "login";
    }


        // ...

        @PostMapping("/login")
        public String processLogin(@ModelAttribute("user") User user, Model model) {
            // Retrieve the list of users from the database based on the provided email
            List<User> userList = userRepository.findByEmail(user.getEmail());

            if (!userList.isEmpty()) {
                // Check each user to find the one with the correct password
                for (User existingUser : userList) {
                    if (existingUser.getPassword().equals(user.getPassword())) {
                        // Passwords match, redirect to the user's homepage
                        return "Userhomepage";
                    }
                }
            }

            // Invalid credentials, display error message on the login page
            model.addAttribute("error", "Invalid username or password");
            return "login";
        }

        // ...
    }






