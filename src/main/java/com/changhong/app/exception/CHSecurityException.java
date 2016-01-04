package com.changhong.app.exception;

/**
 * User: Jack Wang
 * Date: 16-1-4
 * Time: 上午9:58
 */
public class CHSecurityException extends CHApplicationException {

    public CHSecurityException(String message) {
        super(message);
    }

    public CHSecurityException(String message, Throwable cause) {
        super(message, cause);
    }

    public CHSecurityException(Throwable cause) {
        super(cause);
    }
}
