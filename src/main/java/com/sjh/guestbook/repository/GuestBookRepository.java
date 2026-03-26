package com.sjh.guestbook.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sjh.guestbook.domain.GuestBook;

public interface GuestBookRepository extends JpaRepository<GuestBook, Integer>{

}
