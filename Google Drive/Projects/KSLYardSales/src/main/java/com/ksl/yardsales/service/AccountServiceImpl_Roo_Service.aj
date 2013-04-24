// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.service;

import com.ksl.yardsales.domain.Account;
import com.ksl.yardsales.repository.AccountRepository;
import com.ksl.yardsales.service.AccountServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AccountServiceImpl_Roo_Service {
    
    declare @type: AccountServiceImpl: @Service;
    
    declare @type: AccountServiceImpl: @Transactional;
    
    @Autowired
    AccountRepository AccountServiceImpl.accountRepository;
    
    public long AccountServiceImpl.countAllAccounts() {
        return accountRepository.count();
    }
    
    public void AccountServiceImpl.deleteAccount(Account account) {
        accountRepository.delete(account);
    }
    
    public Account AccountServiceImpl.findAccount(Long id) {
        return accountRepository.findOne(id);
    }
    
    public List<Account> AccountServiceImpl.findAllAccounts() {
        return accountRepository.findAll();
    }
    
    public List<Account> AccountServiceImpl.findAccountEntries(int firstResult, int maxResults) {
        return accountRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void AccountServiceImpl.saveAccount(Account account) {
        accountRepository.save(account);
    }
    
    public Account AccountServiceImpl.updateAccount(Account account) {
        return accountRepository.save(account);
    }
    
}