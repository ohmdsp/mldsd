from PIL import Image
import os

def remove_corrupt_images(directory):
    for root, _, files in os.walk(directory):
        for file in files:
            path = os.path.join(root, file)
            try:
                with Image.open(path) as img:
                    img.verify()  # Check image integrity
            except Exception as e:
                print(f"Removing: {path} — {e}")
                os.remove(path)

# Use it on your dataset
remove_corrupt_images('/data/dsd_datasets/multi/train/')
remove_corrupt_images('/data/dsd_datasets/multi/test/')
