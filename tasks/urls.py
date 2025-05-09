from django.urls import path
from .views import TaskListCreateView, TaskDetailView, CategoryListCreateView, CategoryDeleteView, CategoryUpdateView

urlpatterns = [
    path('categories/', CategoryListCreateView.as_view(), name='category-list-create'),
    path('categories/<int:pk>/', CategoryDeleteView.as_view(), name='category-delete'),
    path('categories/<int:pk>/edit/', CategoryUpdateView.as_view(), name='category-update'),
    path('', TaskListCreateView.as_view(), name='task-list-create'),
    path('<int:pk>/', TaskDetailView.as_view(), name='task-detail'),
]
