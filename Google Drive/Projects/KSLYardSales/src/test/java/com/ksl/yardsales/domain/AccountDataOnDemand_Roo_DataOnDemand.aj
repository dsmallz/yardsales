// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.Account;
import com.ksl.yardsales.domain.AccountDataOnDemand;
import com.ksl.yardsales.domain.AddressDataOnDemand;
import com.ksl.yardsales.repository.AccountRepository;
import com.ksl.yardsales.service.AccountService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AccountDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AccountDataOnDemand: @Component;
    
    private Random AccountDataOnDemand.rnd = new SecureRandom();
    
    private List<Account> AccountDataOnDemand.data;
    
    @Autowired
    AddressDataOnDemand AccountDataOnDemand.addressDataOnDemand;
    
    @Autowired
    AccountService AccountDataOnDemand.accountService;
    
    @Autowired
    AccountRepository AccountDataOnDemand.accountRepository;
    
    public Account AccountDataOnDemand.getNewTransientAccount(int index) {
        Account obj = new Account();
        setPassword(obj, index);
        setUserName(obj, index);
        return obj;
    }
    
    public void AccountDataOnDemand.setPassword(Account obj, int index) {
        String password = "password_" + index;
        obj.setPassword(password);
    }
    
    public void AccountDataOnDemand.setUserName(Account obj, int index) {
        String userName = "userName_" + index;
        obj.setUserName(userName);
    }
    
    public Account AccountDataOnDemand.getSpecificAccount(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Account obj = data.get(index);
        Long id = obj.getId();
        return accountService.findAccount(id);
    }
    
    public Account AccountDataOnDemand.getRandomAccount() {
        init();
        Account obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return accountService.findAccount(id);
    }
    
    public boolean AccountDataOnDemand.modifyAccount(Account obj) {
        return false;
    }
    
    public void AccountDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = accountService.findAccountEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Account' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Account>();
        for (int i = 0; i < 10; i++) {
            Account obj = getNewTransientAccount(i);
            try {
                accountService.saveAccount(obj);
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            accountRepository.flush();
            data.add(obj);
        }
    }
    
}
