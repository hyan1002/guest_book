package com.sjh.guestbook.service;

import java.util.List;

import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.sjh.guestbook.domain.GuestBook;
import com.sjh.guestbook.repository.GuestBookRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GuestBookService {
	private final GuestBookRepository guestBookRepository;
	
	public List<GuestBook> listBooks() throws DataAccessException {
		List<GuestBook> bookList = guestBookRepository.findAll(Sort.by(Sort.Direction.DESC, "id"));
		return bookList;
	}
	
	public void addPost(GuestBook book) throws DataAccessException {
		guestBookRepository.save(book);
	}
}