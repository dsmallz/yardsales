package com.ksl.yardsales.repository;

import com.ksl.yardsales.domain.Account;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Account.class)
public interface AccountRepository {
}
