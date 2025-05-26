from cryptography.fernet import Fernet

# Générer une clé Fernet
def generate_key():
    return Fernet.generate_key()

# Chiffrer du texte
def encrypt_text(key, text):
    fernet = Fernet(key)
    encrypted_text = fernet.encrypt(text.encode())  # Convertir en bytes
    return encrypted_text.decode()  # Convertir les bytes en string 

# Déchiffrer du texte
def decrypt_text(key, encrypted_text):
    fernet = Fernet(key)
    decrypted_text = fernet.decrypt(encrypted_text.encode()).decode()  # Décoder
    return decrypted_text

# Lire le texte depuis un fichier
def read_file(file_path):
    with open(file_path, 'r') as file:
        return file.read()

