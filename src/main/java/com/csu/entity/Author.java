package com.csu.entity;

import java.util.List;

public class Author {
    private String name;
    private List<AuthorsAdress> authorsAdresses;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public List<AuthorsAdress> getAuthorsAdresses() {
        return authorsAdresses;
    }
    public String  getAuthorsAdressesString() {
        if (authorsAdresses==null)return "";
        String authoradr="";
        for (int i = 0; i < authorsAdresses.size(); i++) {
            authoradr+=(i+1);
            authoradr+=authorsAdresses.get(i).getDepartment()==null?"":authorsAdresses.get(i).getDepartment()+",";
            authoradr+=authorsAdresses.get(i).getInstitution()==null?"":authorsAdresses.get(i).getInstitution();
            authoradr+=" ";
//            if (i<authorsAdresses.size()-1){
//                authoradr+=" ";
//            }
        }
        return authoradr;
    }

    public void setAuthorsAdresses(List<AuthorsAdress> authorsAdresses) {
        this.authorsAdresses = authorsAdresses;
    }


}
