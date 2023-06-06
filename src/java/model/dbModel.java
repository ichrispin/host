package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class dbModel {
    private int id;
    private String coursename;
    private String coursecode;
    private float credit;
    private byte[] image;
    
    
    
    
    //for result table
    int marks;
    byte[] evidence;
    String regno;
}



