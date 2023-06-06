/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 *
 * @author low key
 */
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UserDetails {
      private int id;
    private String username;
    private String password;
    private String email;
    private  String role ="1";
    private String createdAt;

}
