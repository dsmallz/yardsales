// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.domain;

import com.ksl.yardsales.domain.AccountDataOnDemand;
import com.ksl.yardsales.domain.AccountIntegrationTest;
import com.ksl.yardsales.repository.AccountRepository;
import com.ksl.yardsales.service.AccountService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AccountIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AccountIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AccountIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: AccountIntegrationTest: @Transactional;
    
    @Autowired
    AccountDataOnDemand AccountIntegrationTest.dod;
    
    @Autowired
    AccountService AccountIntegrationTest.accountService;
    
    @Autowired
    AccountRepository AccountIntegrationTest.accountRepository;
    
    @Test
    public void AccountIntegrationTest.testCountAllAccounts() {
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = accountService.countAllAccounts();
        Assert.assertTrue("Counter for 'Account' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AccountIntegrationTest.testFindAccount() {
        Account obj = dod.getRandomAccount();
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = accountService.findAccount(id);
        Assert.assertNotNull("Find method for 'Account' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Account' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AccountIntegrationTest.testFindAllAccounts() {
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = accountService.countAllAccounts();
        Assert.assertTrue("Too expensive to perform a find all test for 'Account', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Account> result = accountService.findAllAccounts();
        Assert.assertNotNull("Find all method for 'Account' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Account' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AccountIntegrationTest.testFindAccountEntries() {
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        long count = accountService.countAllAccounts();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Account> result = accountService.findAccountEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Account' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Account' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AccountIntegrationTest.testFlush() {
        Account obj = dod.getRandomAccount();
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = accountService.findAccount(id);
        Assert.assertNotNull("Find method for 'Account' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAccount(obj);
        Integer currentVersion = obj.getVersion();
        accountRepository.flush();
        Assert.assertTrue("Version for 'Account' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AccountIntegrationTest.testUpdateAccountUpdate() {
        Account obj = dod.getRandomAccount();
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = accountService.findAccount(id);
        boolean modified =  dod.modifyAccount(obj);
        Integer currentVersion = obj.getVersion();
        Account merged = accountService.updateAccount(obj);
        accountRepository.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Account' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AccountIntegrationTest.testSaveAccount() {
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", dod.getRandomAccount());
        Account obj = dod.getNewTransientAccount(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Account' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Account' identifier to be null", obj.getId());
        accountService.saveAccount(obj);
        accountRepository.flush();
        Assert.assertNotNull("Expected 'Account' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AccountIntegrationTest.testDeleteAccount() {
        Account obj = dod.getRandomAccount();
        Assert.assertNotNull("Data on demand for 'Account' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Account' failed to provide an identifier", id);
        obj = accountService.findAccount(id);
        accountService.deleteAccount(obj);
        accountRepository.flush();
        Assert.assertNull("Failed to remove 'Account' with identifier '" + id + "'", accountService.findAccount(id));
    }
    
}
