using System;
using System.Security;
using System.Runtime.InteropServices;
using System.Security.Cryptography;

namespace WinInit
{
	public static class Utils
	{
	    public static byte[] ComputeHash(SecureString secureString)
	    {
            PinnedArray<byte> insecureBytes;
	        IntPtr? unmanagedInsecureString = null;
	        byte[] secureStringHash;
	        
	        try
	        {
	            // copy the secure string to unmanaged memory
	            unmanagedInsecureString = Marshal.SecureStringToBSTR(secureString);

	            // get the string length in bytes
	            int length = Marshal.ReadInt32(unmanagedInsecureString.Value, -4);

                insecureBytes = new PinnedArray<byte>(length);

	            // copy the unmanaged secure string into the byte array
	            for (int i = 0; i < length; i++)
	            {
	                insecureBytes[i] = Marshal.ReadByte(unmanagedInsecureString.Value, i);
	            }
	        
	            using (var sha = new SHA256Cng())
	            {
	                secureStringHash = sha.ComputeHash(insecureBytes.Array);
	            }
	        }
	        finally
	        {
	            // zero and free the unmanged copy of the secure string
	            if (unmanagedInsecureString.HasValue)
	            {
	                Marshal.ZeroFreeBSTR(unmanagedInsecureString.Value);
	            }
	        }
	        
	        return secureStringHash;
	    }
	}

	public class PinnedArray<T> : IDisposable
	{
		private T[] pinnedArray;
        private GCHandle? gcHandleToArray = null;
        private bool disposed = false;

		public PinnedArray(int length)
        {
            // allocate a pinned array so the GC can't move it
            gcHandleToArray = GCHandle.Alloc(pinnedArray = new T[length], GCHandleType.Pinned);
		}
        
        public T this[int index]
        {
            get { return pinnedArray[index]; }
            set { pinnedArray[index] = value; }
        }

        public T[] Array
        {
            get { return pinnedArray; }
        }
        
        public void Dispose()
        {
            if (!disposed)
            {
                if (pinnedArray != null)
                {
                    System.Array.Clear(pinnedArray, 0, pinnedArray.Length);
                    pinnedArray = null;
                }
    
                // free the pinned array so it can be moved/GC'd
                if (gcHandleToArray.HasValue)
                {
                    gcHandleToArray.Value.Free();
                }
            }

            GC.SuppressFinalize(this);
        }
    }
}
