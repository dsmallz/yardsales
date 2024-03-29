// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.ContactInfo;
import com.ksl.yardsales.web.ContactInfoController;
import java.util.List;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

privileged aspect ContactInfoController_Roo_Controller_Json {
    
    @RequestMapping(value = "/{id}", headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContactInfoController.showJson(@PathVariable("id") Long id) {
        ContactInfo contactInfo = contactInfoService.findContactInfo(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        if (contactInfo == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(contactInfo.toJson(), headers, HttpStatus.OK);
    }
    
    @RequestMapping(headers = "Accept=application/json")
    @ResponseBody
    public ResponseEntity<String> ContactInfoController.listJson() {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json; charset=utf-8");
        List<ContactInfo> result = contactInfoService.findAllContactInfoes();
        return new ResponseEntity<String>(ContactInfo.toJsonArray(result), headers, HttpStatus.OK);
    }
    
    @RequestMapping(method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ContactInfoController.createFromJson(@RequestBody String json) {
        ContactInfo contactInfo = ContactInfo.fromJsonToContactInfo(json);
        contactInfoService.saveContactInfo(contactInfo);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.POST, headers = "Accept=application/json")
    public ResponseEntity<String> ContactInfoController.createFromJsonArray(@RequestBody String json) {
        for (ContactInfo contactInfo: ContactInfo.fromJsonArrayToContactInfoes(json)) {
            contactInfoService.saveContactInfo(contactInfo);
        }
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        return new ResponseEntity<String>(headers, HttpStatus.CREATED);
    }
    
    @RequestMapping(method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ContactInfoController.updateFromJson(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        ContactInfo contactInfo = ContactInfo.fromJsonToContactInfo(json);
        if (contactInfoService.updateContactInfo(contactInfo) == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/jsonArray", method = RequestMethod.PUT, headers = "Accept=application/json")
    public ResponseEntity<String> ContactInfoController.updateFromJsonArray(@RequestBody String json) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        for (ContactInfo contactInfo: ContactInfo.fromJsonArrayToContactInfoes(json)) {
            if (contactInfoService.updateContactInfo(contactInfo) == null) {
                return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
            }
        }
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, headers = "Accept=application/json")
    public ResponseEntity<String> ContactInfoController.deleteFromJson(@PathVariable("id") Long id) {
        ContactInfo contactInfo = contactInfoService.findContactInfo(id);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        if (contactInfo == null) {
            return new ResponseEntity<String>(headers, HttpStatus.NOT_FOUND);
        }
        contactInfoService.deleteContactInfo(contactInfo);
        return new ResponseEntity<String>(headers, HttpStatus.OK);
    }
    
}
