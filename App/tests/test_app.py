from app import index

def test_index():
   response = index()
   assert response == "Hello World"
