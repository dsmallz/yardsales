// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.ksl.yardsales.web;

import com.ksl.yardsales.domain.Account;
import com.ksl.yardsales.domain.Address;
import com.ksl.yardsales.domain.ContactInfo;
import com.ksl.yardsales.domain.Tag;
import com.ksl.yardsales.domain.YardSale;
import com.ksl.yardsales.service.AccountService;
import com.ksl.yardsales.service.AddressService;
import com.ksl.yardsales.service.ContactInfoService;
import com.ksl.yardsales.service.YardSaleService;
import com.ksl.yardsales.web.ApplicationConversionServiceFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.core.convert.converter.Converter;
import org.springframework.format.FormatterRegistry;

privileged aspect ApplicationConversionServiceFactoryBean_Roo_ConversionService {
    
    declare @type: ApplicationConversionServiceFactoryBean: @Configurable;
    
    @Autowired
    AccountService ApplicationConversionServiceFactoryBean.accountService;
    
    @Autowired
    AddressService ApplicationConversionServiceFactoryBean.addressService;
    
    @Autowired
    ContactInfoService ApplicationConversionServiceFactoryBean.contactInfoService;
    
    @Autowired
    YardSaleService ApplicationConversionServiceFactoryBean.yardSaleService;
    
    public Converter<Account, String> ApplicationConversionServiceFactoryBean.getAccountToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.ksl.yardsales.domain.Account, java.lang.String>() {
            public String convert(Account account) {
                return new StringBuilder().append(account.getUserName()).append(' ').append(account.getPassword()).toString();
            }
        };
    }
    
    public Converter<Long, Account> ApplicationConversionServiceFactoryBean.getIdToAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.ksl.yardsales.domain.Account>() {
            public com.ksl.yardsales.domain.Account convert(java.lang.Long id) {
                return accountService.findAccount(id);
            }
        };
    }
    
    public Converter<String, Account> ApplicationConversionServiceFactoryBean.getStringToAccountConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.ksl.yardsales.domain.Account>() {
            public com.ksl.yardsales.domain.Account convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Account.class);
            }
        };
    }
    
    public Converter<Address, String> ApplicationConversionServiceFactoryBean.getAddressToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.ksl.yardsales.domain.Address, java.lang.String>() {
            public String convert(Address address) {
                return new StringBuilder().append(address.getAddress()).append(' ').append(address.getCity()).append(' ').append(address.getState()).append(' ').append(address.getZipcode()).toString();
            }
        };
    }
    
    public Converter<Long, Address> ApplicationConversionServiceFactoryBean.getIdToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.ksl.yardsales.domain.Address>() {
            public com.ksl.yardsales.domain.Address convert(java.lang.Long id) {
                return addressService.findAddress(id);
            }
        };
    }
    
    public Converter<String, Address> ApplicationConversionServiceFactoryBean.getStringToAddressConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.ksl.yardsales.domain.Address>() {
            public com.ksl.yardsales.domain.Address convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Address.class);
            }
        };
    }
    
    public Converter<ContactInfo, String> ApplicationConversionServiceFactoryBean.getContactInfoToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.ksl.yardsales.domain.ContactInfo, java.lang.String>() {
            public String convert(ContactInfo contactInfo) {
                return new StringBuilder().append(contactInfo.getContactName()).append(' ').append(contactInfo.getPhoneNumber()).toString();
            }
        };
    }
    
    public Converter<Long, ContactInfo> ApplicationConversionServiceFactoryBean.getIdToContactInfoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.ksl.yardsales.domain.ContactInfo>() {
            public com.ksl.yardsales.domain.ContactInfo convert(java.lang.Long id) {
                return contactInfoService.findContactInfo(id);
            }
        };
    }
    
    public Converter<String, ContactInfo> ApplicationConversionServiceFactoryBean.getStringToContactInfoConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.ksl.yardsales.domain.ContactInfo>() {
            public com.ksl.yardsales.domain.ContactInfo convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), ContactInfo.class);
            }
        };
    }
    
    public Converter<Tag, String> ApplicationConversionServiceFactoryBean.getTagToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.ksl.yardsales.domain.Tag, java.lang.String>() {
            public String convert(Tag tag) {
                return new StringBuilder().append(tag.getTag()).append(' ').append(tag.getDescription()).toString();
            }
        };
    }
    
    public Converter<Long, Tag> ApplicationConversionServiceFactoryBean.getIdToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.ksl.yardsales.domain.Tag>() {
            public com.ksl.yardsales.domain.Tag convert(java.lang.Long id) {
                return Tag.findTag(id);
            }
        };
    }
    
    public Converter<String, Tag> ApplicationConversionServiceFactoryBean.getStringToTagConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.ksl.yardsales.domain.Tag>() {
            public com.ksl.yardsales.domain.Tag convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), Tag.class);
            }
        };
    }
    
    public Converter<YardSale, String> ApplicationConversionServiceFactoryBean.getYardSaleToStringConverter() {
        return new org.springframework.core.convert.converter.Converter<com.ksl.yardsales.domain.YardSale, java.lang.String>() {
            public String convert(YardSale yardSale) {
                return new StringBuilder().append(yardSale.getUrl()).append(' ').append(yardSale.getHtmlDescription()).append(' ').append(yardSale.getPlainTextDescription()).append(' ').append(yardSale.getApproximateLocation()).toString();
            }
        };
    }
    
    public Converter<Long, YardSale> ApplicationConversionServiceFactoryBean.getIdToYardSaleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.Long, com.ksl.yardsales.domain.YardSale>() {
            public com.ksl.yardsales.domain.YardSale convert(java.lang.Long id) {
                return yardSaleService.findYardSale(id);
            }
        };
    }
    
    public Converter<String, YardSale> ApplicationConversionServiceFactoryBean.getStringToYardSaleConverter() {
        return new org.springframework.core.convert.converter.Converter<java.lang.String, com.ksl.yardsales.domain.YardSale>() {
            public com.ksl.yardsales.domain.YardSale convert(String id) {
                return getObject().convert(getObject().convert(id, Long.class), YardSale.class);
            }
        };
    }
    
    public void ApplicationConversionServiceFactoryBean.installLabelConverters(FormatterRegistry registry) {
        registry.addConverter(getAccountToStringConverter());
        registry.addConverter(getIdToAccountConverter());
        registry.addConverter(getStringToAccountConverter());
        registry.addConverter(getAddressToStringConverter());
        registry.addConverter(getIdToAddressConverter());
        registry.addConverter(getStringToAddressConverter());
        registry.addConverter(getContactInfoToStringConverter());
        registry.addConverter(getIdToContactInfoConverter());
        registry.addConverter(getStringToContactInfoConverter());
        registry.addConverter(getTagToStringConverter());
        registry.addConverter(getIdToTagConverter());
        registry.addConverter(getStringToTagConverter());
        registry.addConverter(getYardSaleToStringConverter());
        registry.addConverter(getIdToYardSaleConverter());
        registry.addConverter(getStringToYardSaleConverter());
    }
    
    public void ApplicationConversionServiceFactoryBean.afterPropertiesSet() {
        super.afterPropertiesSet();
        installLabelConverters(getObject());
    }
    
}
