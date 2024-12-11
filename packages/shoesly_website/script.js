// Product data
const products = {
    product1: {
        image: 'https://via.placeholder.com/500x500.png?text=Sneaker+1',
        title: 'Air Max 270',
        price: '$150'
    },
    product2: {
        image: 'https://via.placeholder.com/500x500.png?text=Sneaker+2',
        title: 'Yeezy Boost 350',
        price: '$220'
    },
    product3: {
        image: 'https://via.placeholder.com/500x500.png?text=Sneaker+3',
        title: 'Jordan Retro',
        price: '$180'
    }
    // Add more products as needed
};

// Function to open modal with product details
function openModal(productId) {
    const product = products[productId];
    if (product) {
        document.getElementById('modalImage').src = product.image;
        document.getElementById('modalTitle').textContent = product.title;
        document.getElementById('modalPrice').textContent = product.price;
        document.getElementById('productModal').style.display = 'block';
    }
}

// Function to close modal
function closeModal() {
    document.getElementById('productModal').style.display = 'none';
}

// Close modal when clicking outside the modal content
window.onclick = function(event) {
    const modal = document.getElementById('productModal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}
