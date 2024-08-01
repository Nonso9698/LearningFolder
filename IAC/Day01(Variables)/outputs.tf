output "bucketname" {
    value =  google_storage_bucket.bucket.name  
}


output "mig-name" {
    value =  google_compute_instance_group_manager.appserver.id
}


