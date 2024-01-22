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
public class depositController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AccountRepository accountRepository;

    @PostMapping("/deposit")
    public String depositMoney(@RequestParam("email") String email, @RequestParam("amount") double amount, Model model) {
        List<User> users = userRepository.findByEmail(email);
        if (!users.isEmpty()) {
            // Assuming each user has one associated account
            User user = users.get(0);
            Account account = user.getAccount();
            account.setBalance(account.getBalance() + amount);
            accountRepository.save(account);
            model.addAttribute("updatedBalance", account.getBalance());
            return "depositResult"; // Assuming you have a JSP named "depositResult.jsp"
        } else {
            model.addAttribute("error", "User not found");
            return "deposit_form";
        }
    }

    @GetMapping("/back")
    public String back() {

        return "Userhomepage";
    }
}
