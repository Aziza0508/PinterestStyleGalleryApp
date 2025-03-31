# 📌 Pinterest-Style Image Gallery App  

A **SwiftUI-based image gallery** that mimics Pinterest’s **staggered grid layout**. The app fetches images from [Picsum Photos](https://picsum.photos/) using **concurrent image downloading with GCD (Grand Central Dispatch)**, ensuring smooth performance.  

---

## 🎯 Features  

✅ **Pinterest-Style Grid Layout** – Images are arranged in a staggered way with varying heights for a natural look.  
✅ **Concurrent Image Downloading** – Uses **GCD** (`DispatchGroup`, `DispatchQueue.global`) to download images in parallel.  
✅ **MVVM Architecture** – Clean code structure following the **Model-View-ViewModel** pattern.  
✅ **Dynamic Image Fetching** – Fetches **5 new images** each time the button is clicked, appending to the existing list.  
✅ **Smooth UI Updates** – Ensures all images are downloaded before updating the UI, avoiding flickers.  
✅ **Optimized for Performance** – Uses **background threads** for image fetching while keeping the UI responsive.  

---

## 🛠 Technologies Used  

- **SwiftUI** – For building the user interface  
- **Grand Central Dispatch (GCD)** – For concurrency and background tasks  
- **URLSession** – For making network requests  
- **MVVM Architecture** – To keep the code modular and maintainable  

---

## 📂 Project Structure 
📂 PinterestGalleryApp 
┣ 📂 Models
┃ ┗ 📄 ImageModel.swift
┣ 📂 ViewModels
┃ ┗ 📄 ImagesViewModel.swift
┣ 📂 Views
┃ ┗ 📄 ContentView.swift
┗ 📄 README.md

---

## 🏗 How It Works  

### **1️⃣ Fetching Images**  
- When the user clicks the **"Load More Images"** button, the app requests **5 new images** from `https://picsum.photos/`.  
- These images are downloaded **concurrently** using `DispatchGroup`, allowing multiple images to be fetched simultaneously.  

### **2️⃣ Displaying Images in a Grid**  
- The images are arranged into a **staggered two-column grid layout**, similar to Pinterest.  
- The **shorter column** always gets the next image, ensuring an aesthetically balanced layout.  

### **3️⃣ Performance Optimizations**  
- **Background Threading**: Uses `DispatchQueue.global()` to fetch images in the background, preventing UI lag.  
- **DispatchGroup**: Ensures that all images are downloaded before updating the UI, preventing partial updates and flickering.  

### **4️⃣ Handling Asynchronous UI Updates**  
- Once all images are successfully downloaded, `DispatchGroup.notify(queue: .main)` updates the UI on the **main thread**.  
- This prevents UI freezes and ensures a smooth user experience.  
