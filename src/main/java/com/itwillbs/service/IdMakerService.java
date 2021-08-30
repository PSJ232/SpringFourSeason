package com.itwillbs.service;

public interface IdMakerService {

    public int newId(String table, String colName);

    public int newId(String table, String colName, int option);
}
