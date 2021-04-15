/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.security.SecureRandom;

/**
 *
 * @author PC
 */
public class RamdomOder {

    static final String AB = "0123456789";
    static SecureRandom rnd = new SecureRandom();

    public static int randomInt(int min, int max) {
        int random_int = (int) (Math.random() * (max - min + 1) + min);
        return random_int;
    }

}
