package arch.sm213.machine.student;

import machine.AbstractMainMemory;
import org.junit.Before;
import org.junit.Test;
import machine.AbstractMainMemory.InvalidAddressException;

import static org.junit.Assert.*;

public class MainMemoryTest{

    private MainMemory m;

    @Before
    public void runBefore() {
        m = new MainMemory(32);
    }

    @Test
    public void constructorTest(){
        assertEquals(32,m.length());
    }

    @Test
    public void isAccessAlignedTest(){
        //test addresses that are aligned to corresponding memory length
        assertTrue(m.isAccessAligned(0, 2));		// short
        assertTrue(m.isAccessAligned(8, 4));		// integer
        assertTrue(m.isAccessAligned(32, 8));		// long

        //test addresses that are not aligned properly
        assertFalse(m.isAccessAligned(1, 2));   // short
        assertFalse(m.isAccessAligned(31, 4));	// integer
        assertFalse(m.isAccessAligned(18, 8));	// long

    }




    @Test
    public void bytesToIntegerTest(){
        //base case 00 00 00 00
        int res = m.bytesToInteger((byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x00);
        assertEquals(0,res);

        //low edge bit 00 00 00 01
        int res2 = m.bytesToInteger((byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x01);
        assertEquals(1,res2);

        //largest hex case ff ff ff ff
        int res3 = m.bytesToInteger((byte) 0xff,(byte) 0xff,(byte) 0xff,(byte) 0xff);
        assertEquals(-1,res3);

        //positive num 00 00 00 80
        int res4 = m.bytesToInteger((byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0x80);
        assertEquals(128,res4);

        //the 4th byte be max: 1111 1111  00 00 00 ff
        int res5 = m.bytesToInteger((byte) 0x00,(byte) 0x00,(byte) 0x00,(byte) 0xff);
        assertEquals(255,res5);

        //negative value ff ff ff 00
        int res6 = m.bytesToInteger((byte) 0xff,(byte) 0xff,(byte) 0xff,(byte) 0x00);
        assertEquals(-256,res6);

        // test the max integer value
        assertEquals(Integer.MAX_VALUE, m.bytesToInteger((byte)0x7f,(byte)0xff,(byte)0xff,(byte)0xff));

        //test the min integer value
        assertEquals(Integer.MIN_VALUE, m.bytesToInteger((byte)0x80,(byte)0,(byte)0,(byte)0));

    }


    @Test
    public void integerToBytesTest(){
        //base case
        testBytes(0,0,0,0,m.integerToBytes(0));
        testBytes(0,0,0,0x01,m.integerToBytes(1));

        //test largest hex number -1 to ff ff ff ff
        testBytes(0xff,0xff,0xff,0xff,m.integerToBytes(-1));

        //testing mid cases
        testBytes(0,0,0,0x80,m.integerToBytes(128));
        testBytes(0,0,0,0xff,m.integerToBytes(255));

        //test negative number
        testBytes(0xff,0xff,0xff,0x00,m.integerToBytes(-256));

        //test largest int value
        testBytes(0x7f,0xff,0xff,0xff,m.integerToBytes(Integer.MAX_VALUE));

        //test min int value
        testBytes(0x80,0,0,0,m.integerToBytes(Integer.MIN_VALUE));

    }

    //helper function to test if the bytes are equal
    public void testBytes(int a, int b, int c, int d, byte[] bytes) {
        assertEquals((byte)a, bytes[0]);
        assertEquals((byte)b, bytes[1]);
        assertEquals((byte)c, bytes[2]);
        assertEquals((byte)d, bytes[3]);

    }




    @Test
    public void getTest(){
        //no exception
        try {
            m.get(0,4);
        } catch(InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        //no exception when length is equal to mem length
        try {
            m.get(0,32);
        } catch(InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        //no exception
        try {
            m.get(5,8);
        } catch(InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        //exception when address is a negative value
        try {
            m.get(-1,4);
            fail("was expecting exception");
        } catch(InvalidAddressException e) {
            //expected
        }

        // exception when it is out of bounds
        try {
            m.get(3,30);
            fail("was expecting exception");
        } catch(InvalidAddressException e) {
            //expected
        }

    }


    @Test
    public void setTest(){
        // no exception for short
        try {
            m.set(0,new byte[] {7,9});
        } catch (InvalidAddressException e) {
            fail("was not expecting exception");
        }

        //test get:
        try {
            assertArrayEquals(new byte[] {(byte) 7, (byte) 9},
                    m.get(0,  2));
        } catch (InvalidAddressException e) {
            fail("Was not expecting exception");
        }


        // no exception for integer
        try {
            m.set(2,new byte[] {1,2,3,4});
        } catch (InvalidAddressException e) {
            fail("was not expecting exception");
        }

        //test get:
        try {
            assertArrayEquals(new byte[] {(byte) 1, (byte) 2,(byte) 3, (byte) 4},
                    m.get(2,  4));
        } catch (InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        // no exception for long
        try {
            m.set(6,new byte[] {8,5,1,4,7,9,2,0});
        } catch (InvalidAddressException e) {
            fail("was not expecting exception");
        }

        //test get:
        try {
            assertArrayEquals(new byte[] {(byte) 8, (byte) 5,(byte) 1, (byte) 4,(byte) 7, (byte) 9,(byte) 2, (byte) 0},
                    m.get(6,  8));
        } catch (InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        // no exception for single byte
        try {
            m.set(14,new byte[] {1});
        } catch (InvalidAddressException e) {
            fail("was not expecting exception");
        }

        //test get:
        try {
            assertArrayEquals(new byte[] {(byte) 1},
                    m.get(14,  1));
        } catch (InvalidAddressException e) {
            fail("Was not expecting exception");
        }

        // exception for invalid address
        try {
            m.set(31,new byte[] {0,0,0,0});
            fail("was expecting exception");
        } catch (InvalidAddressException e) {
            // expected
        }

        // exception for invalid address
        try {
            m.set(-1,new byte[] {0,0,0,0});
            fail("was expecting exception");
        } catch (InvalidAddressException e) {
            // expected
        }

    }

    @Test
    public void lengthTest(){
        //test 0 size
        MainMemory testMem = new MainMemory(0);
        assertEquals(0,testMem.length());

        MainMemory testMem2 = new MainMemory(8);
        assertEquals(8,testMem2.length());

        MainMemory testMem3 = new MainMemory(32);
        assertEquals(32,testMem3.length());
    }

}