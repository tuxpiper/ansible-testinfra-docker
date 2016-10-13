def test_conn(TestinfraBackend):
    conn_type = TestinfraBackend.get_connection_type()
    assert conn_type is not None

def test_ping(Ansible):
    ping_result = Ansible("ping")
    assert ping_result is not None

def test_file(File):
    assert File('/etc/passwd').exists

def test_tmp_test(File):
	assert File('/tmp/test').is_directory
