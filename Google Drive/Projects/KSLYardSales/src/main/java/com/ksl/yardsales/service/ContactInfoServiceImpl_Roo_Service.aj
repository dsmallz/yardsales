// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.service;

import com.ksl.yardsales.domain.ContactInfo;
import com.ksl.yardsales.repository.ContactInfoRepository;
import com.ksl.yardsales.service.ContactInfoServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ContactInfoServiceImpl_Roo_Service {
    
    declare @type: ContactInfoServiceImpl: @Service;
    
    declare @type: ContactInfoServiceImpl: @Transactional;
    
    @Autowired
    ContactInfoRepository ContactInfoServiceImpl.contactInfoRepository;
    
    public long ContactInfoServiceImpl.countAllContactInfoes() {
        return contactInfoRepository.count();
    }
    
    public void ContactInfoServiceImpl.deleteContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.delete(contactInfo);
    }
    
    public ContactInfo ContactInfoServiceImpl.findContactInfo(Long id) {
        return contactInfoRepository.findOne(id);
    }
    
    public List<ContactInfo> ContactInfoServiceImpl.findAllContactInfoes() {
        return contactInfoRepository.findAll();
    }
    
    public List<ContactInfo> ContactInfoServiceImpl.findContactInfoEntries(int firstResult, int maxResults) {
        return contactInfoRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void ContactInfoServiceImpl.saveContactInfo(ContactInfo contactInfo) {
        contactInfoRepository.save(contactInfo);
    }
    
    public ContactInfo ContactInfoServiceImpl.updateContactInfo(ContactInfo contactInfo) {
        return contactInfoRepository.save(contactInfo);
    }
    
}
