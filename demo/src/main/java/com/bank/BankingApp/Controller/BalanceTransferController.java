package com.bank.BankingApp.Controller;


import com.bank.BankingApp.entity.Account;
import com.bank.BankingApp.entity.User;
import com.bank.BankingApp.Repository.AccountRepository;
import com.bank.BankingApp.Repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
public class BalanceTransferController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/balance-transfer")
    public String balanceTransfer(@RequestParam String senderEmail,
                                  @RequestParam String recipientEmail,
                                  @RequestParam double amount, Model model) {

        // Assuming you have a service class that handles business logic, validations, etc.
        // You should ideally have a service class where the actual business logic resides.
        // For simplicity, business logic is kept in the controller.

        List<User> senderUsers = userRepository.findByEmail(senderEmail);
        List<User> recipientUsers = userRepository.findByEmail(recipientEmail);

        if (senderUsers.isEmpty() || recipientUsers.isEmpty()) {
            // Handle case where sender or recipient email does not exist
            return "redirect:/error-page"; // Redirect to an error page
        }

        User sender = senderUsers.get(0);
        User recipient = recipientUsers.get(0);

        // Assuming each user has only one account for simplicity
        Account senderAccount = sender.getAccount();
        Account recipientAccount = recipient.getAccount();

        if (senderAccount == null || recipientAccount == null) {
            // Handle case where sender or recipient does not have an account
            return "redirect:/error-page"; // Redirect to an error page
        }

        // Ensure sender has enough balance
        if (senderAccount.getBalance() >= amount) {
            // Update balances
            senderAccount.setBalance(senderAccount.getBalance() - amount);
            recipientAccount.setBalance(recipientAccount.getBalance() + amount);

            // Save updated accounts
            accountRepository.save(senderAccount);
            accountRepository.save(recipientAccount);
            model.addAttribute("senderAccountBalance", senderAccount.getBalance());

            return "success-page"; // Redirect to a success page
        } else {
            // Handle case where sender does not have enough balance
            return "redirect:/error-page"; // Redirect to an error page
        }
    }
}
