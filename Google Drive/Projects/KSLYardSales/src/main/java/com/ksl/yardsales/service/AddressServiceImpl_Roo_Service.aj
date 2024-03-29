// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.service;

import com.ksl.yardsales.domain.Address;
import com.ksl.yardsales.repository.AddressRepository;
import com.ksl.yardsales.service.AddressServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AddressServiceImpl_Roo_Service {
    
    declare @type: AddressServiceImpl: @Service;
    
    declare @type: AddressServiceImpl: @Transactional;
    
    @Autowired
    AddressRepository AddressServiceImpl.addressRepository;
    
    public long AddressServiceImpl.countAllAddresses() {
        return addressRepository.count();
    }
    
    public void AddressServiceImpl.deleteAddress(Address address) {
        addressRepository.delete(address);
    }
    
    public Address AddressServiceImpl.findAddress(Long id) {
        return addressRepository.findOne(id);
    }
    
    public List<Address> AddressServiceImpl.findAllAddresses() {
        return addressRepository.findAll();
    }
    
    public List<Address> AddressServiceImpl.findAddressEntries(int firstResult, int maxResults) {
        return addressRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void AddressServiceImpl.saveAddress(Address address) {
        addressRepository.save(address);
    }
    
    public Address AddressServiceImpl.updateAddress(Address address) {
        return addressRepository.save(address);
    }
    
}
