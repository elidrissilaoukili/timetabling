package com.timetabling.system.timetabling;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;

public class OutputCapturer {
    private ByteArrayOutputStream outputStream;
    private PrintStream originalOut;

    public void startCapture() {
        // Save the original System.out
        originalOut = System.out;

        // Redirect System.out to a custom PrintStream
        outputStream = new ByteArrayOutputStream();
        System.setOut(new PrintStream(outputStream));
    }

    public String stopCapture() {
        // Restore the original System.out
        System.setOut(originalOut);

        // Return the captured output as a string
        return outputStream.toString();
    }
}