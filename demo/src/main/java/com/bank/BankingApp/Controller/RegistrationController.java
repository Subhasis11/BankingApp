package com.bank.BankingApp.Controller;
import com.bank.BankingApp.Repository.AccountRepository;
import com.bank.BankingApp.entity.Account;
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


// RegistrationController.java
@Controller
public class RegistrationController {

	private static final Logger logger = LoggerFactory.getLogger(RegistrationController.class);

	@Autowired
	private UserRepository userRepository;
	@Autowired
	private AccountRepository accountRepository;

	@GetMapping
	public String display(){
		return "HELLO";
	}
	@GetMapping("/register")
	public String showRegistrationForm(Model model) {
		model.addAttribute("user", new User());
		return "home";
	}

/*	@PostMapping("/register1")
	public String registerUser(@ModelAttribute User user, Model model) {
		// Logging for debugging
		logger.info("Received registration request for user: {}", user);

		try {
			// Step 1: Save the User entity to generate id
			User savedUser = userRepository.save(user);

			// Step 2: Create an account for the user with the generated id
			Account account = new Account(500.0, savedUser.getId());
		//	account.setUser();
			// Step 3: Save the Account entity
			accountRepository.save(account);

			model.addAttribute("registrationSuccess", true);
			model.addAttribute("accountNumber", account.getAccountNumber()); // Pass account number to the view
		} catch (Exception e) {
			logger.error("Error registering user: {}", e.getMessage(), e);
			// Handle the exception or rethrow it for detailed error messages
		}

		return "Regsuccesspopup";  // Redirect to the login page
	}
*/
@PostMapping("/register1")
public String registerUser(@ModelAttribute User user, Model model) {
	// Logging for debugging
	logger.info("Received registration request for user: {}", user);

	try {
		// Step 1: Save the User entity to generate id
		User savedUser = userRepository.save(user);
		//Optional<User> optionalUser = userRepository.findById(savedUser.getId());
		// Step 2: Create an account for the user with the generated id
		//Account account = new Account(500.0, savedUser.getId(),savedUser);
		Account account=new Account();
		account.setBalance(500.0);
		account.setAccountNumber(RegistrationController.generateAccountNumber(savedUser.getId()));
		account.setUser(savedUser);
			//account.setUser(savedUser);

		// Step 3: Save the Account entity
		accountRepository.save(account);

		model.addAttribute("registrationSuccess", true);
		model.addAttribute("accountNumber", account.getAccountNumber()); // Pass account number to the view
	} catch (Exception e) {
		logger.error("Error registering user: {}", e.getMessage(), e);
		// Handle the exception or rethrow it for detailed error messages
	}

	return "Regsuccesspopup";  // Redirect to the login page
}
	private static String generateAccountNumber(Long userId) {
		logger.info("Generating account number for user ID: {}", userId);
		return "AC" + userId; // For example, appending "AC" to the user ID
	}
}