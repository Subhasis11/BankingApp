package com.bank.BankingApp.Controller;


import com.bank.BankingApp.entity.User;
import com.bank.BankingApp.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
public class BalanceController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/balance")
    public String showBalanceForm() {
        return "balance-form"; // This should be the name of your balance form JSP/HTML page
    }

    @PostMapping("/balance")
    public String processBalanceForm(@RequestParam("email") String email, Model model) {
        List<User> userList = userRepository.findByEmail(email);

        if (!userList.isEmpty()) {
            User user = userList.get(0); // Assuming email is unique, so taking the first user from the list
            double balance = user.getAccount().getBalance();
            model.addAttribute("balance", balance);
            return "balance-result"; // This should be the name of your balance result JSP/HTML page
        } else {
            model.addAttribute("error", "User not found");
            return "balance-error"; // This should be the name of your error JSP/HTML page
        }
    }

    @GetMapping("/Userhomepage1")
    public String userHomePage() {
        return "Userhomepage"; // Assuming "user-homepage" is the view name
    }
}
