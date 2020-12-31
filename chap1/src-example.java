package ness.monitor.runtime.impl.java.agent;

import java.lang.instrument.ClassFileTransformer;
import java.lang.instrument.IllegalClassFormatException;
import java.security.ProtectionDomain;

import org.objectweb.asm.ClassReader;
import org.objectweb.asm.ClassWriter;


class Transformer implements ClassFileTransformer{
	//
	// ClassFileTransformer implementation
	//
	@Override
	public byte[] transform(ClassLoader loader, String name, Class<?> type, ProtectionDomain pd, byte[] image) throws IllegalClassFormatException {
		if (Main.isApplicationType(name)) {
			ClassReader reader = new ClassReader(image);
			ClassWriter writer = new ClassWriter(reader, ClassWriter.COMPUTE_MAXS);
			reader.accept(new TypeIntrumentor(writer), ClassReader.SKIP_DEBUG);
			image = writer.toByteArray();
		}
		return image;  
	}
}
