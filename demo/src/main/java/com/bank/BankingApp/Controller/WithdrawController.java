package com.bank.BankingApp.Controller;

import com.bank.BankingApp.entity.Account;
import com.bank.BankingApp.entity.User;
import com.bank.BankingApp.Repository.AccountRepository;
import com.bank.BankingApp.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class WithdrawController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/withdraw")
    public String withdrawMoney(@RequestParam("email") String email, @RequestParam("amount") double amount, Model model) {
        List<User> users = userRepository.findByEmail(email);
        if (!users.isEmpty()) {
            // Assuming each user has one associated account
            User user = users.get(0);
            Account account = user.getAccount();

            // Check if the account has sufficient balance for withdrawal
            if (account.getBalance() >= amount) {
                account.setBalance(account.getBalance() - amount);
                accountRepository.save(account);
                model.addAttribute("updatedBalance", account.getBalance());
                return "withdrawResult"; // Assuming you have a JSP named "withdrawResult.jsp"
            } else {
                model.addAttribute("error", "Insufficient balance for withdrawal");
                return "withdraw_form";
            }
        } else {
            model.addAttribute("error", "User not found");
            return "withdraw_form";
        }
    }


}
