// SystemImports.swift
// This file ensures proper system imports for Swift System package compatibility

#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#endif

// Re-export system functions needed by Swift System package
// This helps resolve the missing system function errors

// Memory functions
@_silgen_name("strlen")
public func _stdlib_strlen(_ s: UnsafePointer<CChar>) -> Int

@_silgen_name("memset")
public func _stdlib_memset(_ dest: UnsafeMutableRawPointer!, _ val: Int32, _ len: Int) -> UnsafeMutableRawPointer!

// File operations
@_silgen_name("open")
public func _stdlib_open(_ path: UnsafePointer<CChar>!, _ oflag: Int32) -> Int32

@_silgen_name("open")
public func _stdlib_open(_ path: UnsafePointer<CChar>!, _ oflag: Int32, _ mode: mode_t) -> Int32

@_silgen_name("close")
public func _stdlib_close(_ fd: Int32) -> Int32

@_silgen_name("read")
public func _stdlib_read(_ fd: Int32, _ buf: UnsafeMutableRawPointer!, _ nbyte: Int) -> Int

@_silgen_name("pread")
public func _stdlib_pread(_ fd: Int32, _ buf: UnsafeMutableRawPointer!, _ nbyte: Int, _ offset: off_t) -> Int

@_silgen_name("write")
public func _stdlib_write(_ fd: Int32, _ buf: UnsafeRawPointer!, _ nbyte: Int) -> Int

@_silgen_name("pwrite")
public func _stdlib_pwrite(_ fd: Int32, _ buf: UnsafeRawPointer!, _ nbyte: Int, _ offset: off_t) -> Int

@_silgen_name("dup")
public func _stdlib_dup(_ fd: Int32) -> Int32

@_silgen_name("dup2")
public func _stdlib_dup2(_ fd: Int32, _ fd2: Int32) -> Int32

@_silgen_name("pipe")
public func _stdlib_pipe(_ fds: UnsafeMutablePointer<Int32>!) -> Int32

@_silgen_name("ftruncate")
public func _stdlib_ftruncate(_ fd: Int32, _ length: off_t) -> Int32

@_silgen_name("mkdir")
public func _stdlib_mkdir(_ path: UnsafePointer<CChar>!, _ mode: mode_t) -> Int32

@_silgen_name("rmdir")
public func _stdlib_rmdir(_ path: UnsafePointer<CChar>!) -> Int32

@_silgen_name("unlinkat")
public func _stdlib_unlinkat(_ fd: Int32, _ path: UnsafePointer<CChar>!, _ flag: Int32) -> Int32

@_silgen_name("rewinddir")
public func _stdlib_rewinddir(_ dir: UnsafeMutableRawPointer!) -> Void

@_silgen_name("closedir")
public func _stdlib_closedir(_ dir: UnsafeMutableRawPointer!) -> Int32

@_silgen_name("openat")
public func _stdlib_openat(_ fd: Int32, _ path: UnsafePointer<CChar>!, _ oflag: Int32) -> Int32

@_silgen_name("getenv")
public func _stdlib_getenv(_ name: UnsafePointer<CChar>!) -> UnsafeMutablePointer<CChar>?

// Thread functions
#if canImport(Darwin)
public typealias _stdlib_pthread_key_t = pthread_key_t

@_silgen_name("pthread_key_create")
public func _stdlib_pthread_key_create(_ key: UnsafeMutablePointer<_stdlib_pthread_key_t>!, _ destructor: (@convention(c) (UnsafeMutableRawPointer) -> Void)?) -> Int32

@_silgen_name("pthread_setspecific")
public func _stdlib_pthread_setspecific(_ key: _stdlib_pthread_key_t, _ value: UnsafeMutableRawPointer!) -> Int32

@_silgen_name("pthread_getspecific")
public func _stdlib_pthread_getspecific(_ key: _stdlib_pthread_key_t) -> UnsafeMutableRawPointer!
#endif