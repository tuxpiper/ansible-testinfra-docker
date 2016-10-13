def test_etc_passwd(File):
    assert File("/etc/passwd").exists
