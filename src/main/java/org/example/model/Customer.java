package org.example.model;

public class Customer {
    private String userName;
    private String password;
    private String name;
    private String gender;

    public String getUserName() { return userName;
    }

    public String getPassword() { return password;
    }

    public String getName() { return name;
    }

    public void setUserName(String userName) { this.userName = userName;
    }

    public void setPassword(String password) { this.password = password;
    }

    public void setName(String name) { this.name = name;
    }

    public String getGender() { return gender;
    }

    public void setGender(String gender) { this.gender = gender;
    }
}
